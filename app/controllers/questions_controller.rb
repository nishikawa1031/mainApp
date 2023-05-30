class QuestionsController < ApplicationController
    def show
        subject_traslate
        yml = File.open("config/files/all/#{@subject_name}#{@year}.ja.yml") { |f| YAML.load(f) }

        question_set = yml["ja"][@subject_name][@year][@question_num]

        @correct = (params[:answer].to_i == correct_answer)
        @question = question_set["questions"]
        @answer = question_set["answer"].values.filter_map { |v| v if v }
        @additional_answer = question_set["additional_answer"].values.filter_map { |v| v if v }
    end

    def check
        subject_traslate

        selected_answer = params[:answer].to_i  # ユーザーが選んだ選択肢を取得
        if selected_answer == correct_answer
            redirect_to action: :show, params:{'answer' => selected_answer}
        else
            redirect_to action: :show, params:{'answer' => selected_answer}
        end
    end

    private
        def correct_answer
            answers_yml = File.open("config/files/answers/#{@subject_name}/#{@year}.yml") { |f| YAML.load(f) }
            answers_yml[@question_num]
        end
        def subject_traslate
            @year = params[:year_id].to_i
            @subject = params[:subject_id].to_i
            @question_num = params[:id].to_i

            # subjectの数字がどの科目を表すのかここをみるまでわからないのでリファクタする必要がある。
            @subject_name = "minpo" if @subject == 1
            @subject_name = "kenpo" if @subject == 2
            @subject_name = "keiho" if @subject == 3
        end
end
