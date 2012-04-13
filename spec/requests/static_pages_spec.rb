require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_selector('h1', 
												text: 'Take Your Lifestyle To The Next Level') }
		it { should have_selector('title',
												text: full_title('Grooming Products For Men'))  }

	end

	describe "Works page" do
		before { visit works_path }

		it { should have_selector('h1', 
												text: 'How It Works') }
		it { should have_selector('title',
												text: full_title('How It Works')) }

	end

	describe "Tips page" do
		before { visit tips_path }

		it { should have_selector('h1',
												text: 'Grooming Tips') }


		it { should have_selector('title',
												text: full_title('Grooming Tips')) }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_selector('h1',
												text: 'About Us') }
		it { should have_selector('title',
												text: full_title('About Us')) }
	end
end
