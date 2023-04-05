class QuestionsController < ApplicationController
    def show
        year = params[:year_id].to_i
        subject = params[:subject_id].to_i
        question_num = params[:id].to_i
        subject_name = "minpo" if subject == 1
        subject_name = "kenpo" if subject == 2
        subject_name = "keiho" if subject == 3
        yml = File.open("config/files/all/#{subject_name}#{year}.ja.yml") { |f| YAML.load(f) }

        question_set = yml["ja"][subject_name][year][question_num]
        
        @question = question_set["questions"]
        @answer = question_set["answer"].values.filter_map { |v| v if v }
        @additional_answer = question_set["additional_answer"].values.filter_map { |v| v if v }
    end
end
