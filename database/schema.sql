-- Create table for experiences
CREATE TABLE IF NOT EXISTS experiences (
  id BIGSERIAL PRIMARY KEY,
  city VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  author VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO experiences (city, title, content, author)
VALUES
('Chennai', 'Marina Magic', 'Enjoyed the sunset at Marina Beach.', 'Gokul'),
('Bangalore', 'Tech Town', 'Explored MG Road and had some amazing food.', 'Priya'),
('Mumbai', 'City of Dreams', 'Loved the vibe at Marine Drive!', 'Ravi'),
('Chennai', 'Temple Visit', 'Visited Kapaleeshwarar Temple. Spiritual vibes.', 'Kumar'),
('Delhi', 'Historic Trails', 'Walked around India Gate and Red Fort.', 'Anjali')
ON CONFLICT DO NOTHING;