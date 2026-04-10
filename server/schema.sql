-- Complete Database Schema for To-Do List Application

-- Users table
CREATE TABLE IF NOT EXISTS user_accounts (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL, -- Used for login based on index.js logic
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Lists table (Groups of tasks)
CREATE TABLE IF NOT EXISTS lists (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES user_accounts(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'pending', -- 'pending', 'completed', 'archived'
    created_at TIMESTAMP DEFAULT NOW()
);

-- Items table (Individual tasks within a list)
CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    list_id INTEGER REFERENCES lists(id) ON DELETE CASCADE,
    description TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'pending', -- 'pending', 'completed'
    created_at TIMESTAMP DEFAULT NOW()
);

-- Sessions table (required by connect-pg-simple for session persistence)
CREATE TABLE IF NOT EXISTS "session" (
  "sid" varchar NOT NULL COLLATE "default",
  "sess" json NOT NULL,
  "expire" timestamp(6) NOT NULL,
  CONSTRAINT "session_pkey" PRIMARY KEY ("sid")
) WITH (OIDS=FALSE);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_user_accounts_name ON user_accounts(name);
CREATE INDEX IF NOT EXISTS idx_lists_user_id ON lists(user_id);
CREATE INDEX IF NOT EXISTS idx_items_list_id ON items(list_id);
CREATE INDEX IF NOT EXISTS idx_lists_status ON lists(status);
CREATE INDEX IF NOT EXISTS idx_items_status ON items(status);
CREATE INDEX IF NOT EXISTS "session_expire_idx" ON "session" ("expire");
