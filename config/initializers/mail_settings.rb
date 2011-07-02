ActionMailer::Base.smtp_settings = {
  :tls                  => true,
  :address              =>"smt.gmail.com",
	:port                 =>587,
  :enable_starttls_auto => true,
	:domain               =>"gmail.com",
  :autentication	      =>:plain,
  :user_name	          =>"joseseverinojr",
	:password	            =>"123jose123"
}

