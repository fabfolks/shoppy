# encoding: UTF-8
require 'spec_helper'

describe AddressesController do
  context "state_options" do
    it "should return all states for a known country" do
      get :state_options, parent_region: "IN"
      expected_states = "[[\"Andaman and Nicobar Islands\",\"AN\"],[\"Andhra Pradesh\",\"AP\"],[\"Arunāchal Pradesh\",\"AR\"],[\"Assam\",\"AS\"],[\"Bihār\",\"BR\"],[\"Chandīgarh\",\"CH\"],[\"Chhattīsgarh\",\"CT\"],[\"Damān and Diu\",\"DD\"],[\"Delhi\",\"DL\"],[\"Dādra and Nagar Haveli\",\"DN\"],[\"Goa\",\"GA\"],[\"Gujarāt\",\"GJ\"],[\"Himāchal Pradesh\",\"HP\"],[\"Haryāna\",\"HR\"],[\"Jharkhand\",\"JH\"],[\"Jammu and Kashmīr\",\"JK\"],[\"Karnātaka\",\"KA\"],[\"Kerala\",\"KL\"],[\"Lakshadweep\",\"LD\"],[\"Mahārāshtra\",\"MH\"],[\"Meghālaya\",\"ML\"],[\"Manipur\",\"MN\"],[\"Madhya Pradesh\",\"MP\"],[\"Mizoram\",\"MZ\"],[\"Nāgāland\",\"NL\"],[\"Orissa\",\"OR\"],[\"Punjab\",\"PB\"],[\"Pondicherry\",\"PY\"],[\"Rājasthān\",\"RJ\"],[\"Sikkim\",\"SK\"],[\"Tamil Nādu\",\"TN\"],[\"Tripura\",\"TR\"],[\"Uttaranchal\",\"UL\"],[\"Uttar Pradesh\",\"UP\"],[\"West Bengal\",\"WB\"]]" 
      response.body.should == expected_states
    end

    it "should return none for an unknown country" do
      get :state_options, parent_region: "AS"
      response.body.should ==  "{\"content\":\"None\"}"
    end
  end
end
