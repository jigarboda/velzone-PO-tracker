-- Run this in Supabase SQL Editor (Dashboard → SQL Editor → New query)

-- Table to store purchase orders
CREATE TABLE IF NOT EXISTS purchase_orders (
  id TEXT PRIMARY KEY,
  po_number TEXT NOT NULL,
  nickname TEXT DEFAULT '',
  factory TEXT DEFAULT '',
  po_date TEXT DEFAULT '',
  size TEXT DEFAULT '',
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Auto-update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER purchase_orders_updated
  BEFORE UPDATE ON purchase_orders
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- Enable Row Level Security (but allow all for now - add auth later)
ALTER TABLE purchase_orders ENABLE ROW LEVEL SECURITY;

-- Allow all operations with anon key (for single-user use)
CREATE POLICY "Allow all" ON purchase_orders
  FOR ALL USING (true) WITH CHECK (true);

-- Enable Realtime for this table
ALTER PUBLICATION supabase_realtime ADD TABLE purchase_orders;

-- Needed for realtime DELETE events to include the row id
ALTER TABLE purchase_orders REPLICA IDENTITY FULL;
