-- AlterTable
DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_name = 'Partner'
      AND column_name = 'partershipReason'
  ) THEN
    ALTER TABLE "Partner" RENAME COLUMN "partershipReason" TO "partnershipReason";
  END IF;
END $$;

-- AlterTable
ALTER TABLE "Event" ADD COLUMN IF NOT EXISTS "endDate" TIMESTAMP(3),
ADD COLUMN IF NOT EXISTS "featured" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN IF NOT EXISTS "mode" TEXT NOT NULL DEFAULT 'in-person',
ADD COLUMN IF NOT EXISTS "registerUrl" TEXT,
ADD COLUMN IF NOT EXISTS "registered" INTEGER,
ADD COLUMN IF NOT EXISTS "speakers" TEXT[],
ADD COLUMN IF NOT EXISTS "tagline" TEXT,
ADD COLUMN IF NOT EXISTS "timeLabel" TEXT;
