# Real-Time-SMS-Alert

This project is a fundamental web application built using the Ruby on Rails 7.0 framework and utilizes PostgreSQL as its database management system and the app UI is designed using Tailwind and Bootstrap.

In this application, Users can register by entering their phone numbers to receive SMS notifications triggered by specific events. After registration, users receive an initial SMS notification. Additionally, pressing two designated buttons on the homepage initiates the sending of SMS messages with unique content. One button directs users to an edit page, where changing the phone number triggers another message. The second button simply sends a text message when clicked. The Twilio API integration facilitates the transmission of these SMS messages.

**Demo**

[https://www.loom.com/share/fd5f927058f348c481ce9dc8a2872045]

# Features

- Utilizing the Devise gem for authentication, incorporating additional attributes such as name and phone number.
- Implementing real-time SMS notifications triggered during specific events (signup and via two buttons on the homepage).
- Integrating Twilio for SMS sending services.

# Build With

- Framework: Ruby on Rails 7.0
- Ruby version: 3.1.2
- Database: PostgreSQL
- API: Twilio (gem twilio-ruby)

# Getting Started

## Prerequisites

```bash
brew install postgresql
\curl -sSL https://get.rvm.io | bash -s stable
rvm i 3.2.2
```

## Installation

1. **Clone the Repository**:

```bash
git clone https://github.com/Chsaleem31/real-time-notis.git
```

2.  **Edit credentials file**:

```bash
EDITOR=vim rails credentials:edit
OR
EDITOR="code --wait" rails credentials:edit --environment=development
```

```
twilio:
   account_sid: your account sid
   auth_token: auth token
```

3. **Credentials in ENV**:

   - Add your phone number in .evn that is provided by twilio to use to send the messages from that number in service file
     TWILIO_FROM_SENDER=number provide by twilio
     TWILIO_ACCOUNT_SID=your twilio account id
     TWILIO_AUTH_TOKEN=your twilio auth token
     TWILIO_TO_NUMBER=your twilio verified number to recieve the message

4. **Initialize the Database**:

   - Before starting the application for the first time, ensure that the database is set up correctly.

   ```bash
   bundle install
   rails db:create db:migrate
   ```

   - Now run the application with

   ```bash
   rails assets:precompile
   rails s
   visit the url localhost:3000
   ```

5. **Rspecs**:

   To run Rspec please run the following command:

   ```bash
   rspec
   ```
