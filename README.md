# Real-Time-SMS-Alert

This project is a fundamental web application built using the Ruby on Rails 7.0 framework and utilizes PostgreSQL as its database management system and the app UI is designed using Tailwind and Bootstrap.

In this application, Users can register by entering their phone numbers to receive SMS notifications triggered by specific events. After registration, users receive an initial SMS notification. Additionally, pressing two designated buttons on the homepage initiates the sending of SMS messages with unique content. One button directs users to an edit page, where changing the phone number triggers another message. The second button simply sends a text message when clicked. The Twilio API integration facilitates the transmission of these SMS messages.

![Signup-page](https://github.com/rababzahra8/real-time-sms-alert/assets/88228887/134244a2-68f6-415a-86fb-b1eaabc63dc5)

![SMS-alert](https://github.com/rababzahra8/real-time-sms-alert/assets/88228887/25c1ef82-6feb-4634-82bf-cec828bd6044)


# App Build

- Framework: Ruby on Rails 7.0
- API: Twilio (gem twilio-ruby)
- Database: PostgreSQL
- UI: Tailwind

# Main Features

- Implementing real-time SMS notifications triggered during specific events (signup and via two buttons on the homepage).
- Integrating Twilio for SMS sending services.
- Utilizing the Devise gem for authentication, incorporating additional attributes such as name and phone number.


# What is needed to run this app:

## Installations

1. **Repository Clone Command**:

```bash
git clone https://github.com/Chsaleem31/real-time-notis.git
```

2. **Credentials in ENV**:

   - Add your phone number in .evn that is provided by twilio to use to send the messages from that number in service file
     TWILIO_FROM_SENDER=number provide by twilio
     TWILIO_TO_NUMBER=your twilio verified number to recieve the message

3.  **Credentials file Changes**:

```bash
EDITOR=vim rails credentials:edit
OR
EDITOR="code --wait" rails credentials:edit --environment=development
```

```
twilio:
   account_sid: your account sid (provided by twilio)
   auth_token: auth token  (provided by twilio)
```

4. **Database Initilization Commands**:

   - Ensure that the database is set up correctly.

   ```bash
   bundle install
   rails db:create db:migrate
   ```

   - Start application

   ```bash
   rails assets:precompile
   rails s
   visit the url localhost:3000
   ```

5. **Rspecs Commands**:

   To run Rspec please run the following command:

   ```bash
   rspec
   ```
