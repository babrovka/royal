class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.checked
  end
end
