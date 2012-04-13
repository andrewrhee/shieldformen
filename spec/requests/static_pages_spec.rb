require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "Shield For Men" }

	describe "Home page" do

		it "should have the h1 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('h1', 
												:text => 'Take Your Lifestyle To The Next Level')
		end

		it "should have the title 'Grooming Products For Men'" do
			visit '/static_pages/home'
			page.should have_selector('title',
												:text => "Grooming Products For Men | #{base_title}")
		end

	end

	describe "Works page" do
		it "should have the h1 'How It Works'" do
			visit '/static_pages/works'
			page.should have_selector('h1', 
													:text  => 'How It Works')
		end

		it "should have the title 'How It Works'" do
			visit '/static_pages/works'
			page.should have_selector('title',
												:text => "How It Works | #{base_title}")
		end
	end

	describe "Tips page" do
		it "should have the h1 'Grooming Tips'" do
			visit '/static_pages/tips/'
			page.should have_selector('h1',
													:text => 'Grooming Tips')
		end

		it "should have the title 'Grooming Tips'" do
			visit '/static_pages/tips'
			page.should have_selector('title',
												:text => "Grooming Tips | #{base_title}")
		end
	end

	describe "About page" do
		it "should have the h1 'About Us'" do
			visit '/static_pages/about/'
			page.should have_selector('h1',
													:text => 'About Us')
		end

		it "should have the title 'About Us'" do
			visit '/static_pages/about'
			page.should have_selector('title',
												:text => "About Us | #{base_title}")
		end
	end
end
