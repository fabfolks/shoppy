class AddressesController < ApplicationController

  def state_options
    country = Carmen::Country.coded(params[:parent_region])
    state_list = []
    country.subregions.each do |region|
      state_list << [region.name, region.code]
    end
    unless state_list.empty?
      render :json => state_list
    else
      render :json => {"content" => "None"}.to_json
    end
  end
end
