class QuestionsController < ApplicationController
    def show
        year = params[:year_id].to_i
        subject = params[:subject_id]
        question_num = params[:id].to_i
        yml = File.open("config/files/all/minpo2015.ja.yml") { |f| YAML.load(f) }

        question_set = yml["ja"]["minpo"][year][question_num]
        
        @question = question_set["questions"]
        @answer = question_set["answer"].values.filter_map { |v| v if v }
        @additional_answer = question_set["additional_answer"].values.filter_map { |v| v if v }
    end
end
