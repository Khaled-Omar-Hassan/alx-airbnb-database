
CREATE TABLE booking_partitioned (
  booking_id   CHAR(36)     PRIMARY KEY,
  property_id  CHAR(36)     NOT NULL,
  user_id      CHAR(36)     NOT NULL,
  start_date   DATE         NOT NULL,
  end_date     DATE         NOT NULL,
  total_price  DECIMAL(10,2) NOT NULL,
  status       ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK (end_date > start_date)
)
PARTITION BY RANGE (TO_DAYS((start_date))) (
	PARTITION p0 VALUES LESS THAN (TO_DAYS('2025-04-03')),   -- before 2025-04-03
    PARTITION p1 VALUES LESS THAN (TO_DAYS('2025-05-19')),   -- before 2025-05-19
    PARTITION p2 VALUES LESS THAN (TO_DAYS('2025-07-04')),   -- before 2025-07-04
    PARTITION p3 VALUES LESS THAN (TO_DAYS('2025-08-20'))    -- before 2025-08-20
);
