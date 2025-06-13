CREATE DATABASE air_bnb;
USE air_bnb;

-- 1. User Table
CREATE TABLE User (
  user_id        CHAR(36)     PRIMARY KEY,
  first_name     VARCHAR(100) NOT NULL,
  last_name      VARCHAR(100) NOT NULL,
  email          VARCHAR(255) NOT NULL UNIQUE,
  password_hash  VARCHAR(255) NOT NULL,
  phone_number   VARCHAR(20),
  role           ENUM('guest', 'host', 'admin') NOT NULL,
  created_at     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_user_email ON User(email);

-- 2. Property Table
CREATE TABLE Property (
  property_id     CHAR(36)     PRIMARY KEY,
  host_id         CHAR(36)     NOT NULL,
  name            VARCHAR(200) NOT NULL,
  description     TEXT         NOT NULL,
  location        VARCHAR(255) NOT NULL,
  pricepernight   DECIMAL(10,2) NOT NULL,
  created_at      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_property_host ON Property(host_id);

-- 3. Booking Table
CREATE TABLE Booking (
  booking_id   CHAR(36)     PRIMARY KEY,
  property_id  CHAR(36)     NOT NULL,
  user_id      CHAR(36)     NOT NULL,
  start_date   DATE         NOT NULL,
  end_date     DATE         NOT NULL,
  total_price  DECIMAL(10,2) NOT NULL,
  status       ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (end_date > start_date),
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);

-- 4. Payment Table
CREATE TABLE Payment (
  payment_id      CHAR(36)     PRIMARY KEY,
  booking_id      CHAR(36)     NOT NULL,
  amount          DECIMAL(10,2) NOT NULL,
  payment_date    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_method  ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);
CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- 5. Review Table
CREATE TABLE Review (
  review_id   CHAR(36)   PRIMARY KEY,
  property_id CHAR(36)   NOT NULL,
  user_id     CHAR(36)   NOT NULL,
  rating      INT        NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment     TEXT       NOT NULL,
  created_at  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);

-- 6. Message Table
CREATE TABLE Message (
  message_id    CHAR(36)  PRIMARY KEY,
  sender_id     CHAR(36)  NOT NULL,
  recipient_id  CHAR(36)  NOT NULL,
  message_body  TEXT      NOT NULL,
  sent_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);
