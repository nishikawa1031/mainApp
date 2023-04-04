class QuestionsController < ApplicationController
    def show
        year = params[:year_id].to_i
        subject = params[:subject_id]
        question_num = params[:id].to_i
        yml = File.open("config/files/all/minpo2015.ja.yml") { |f| YAML.load(f) }

        @questions = yml["ja"]["minpo"][year][question_num]
    end
end
