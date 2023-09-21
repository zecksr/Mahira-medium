resource "aws_s3_bucket" "mahira" {
  bucket = var.s3_bucket_name
}
 
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.mahira.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "${aws_iam_user.mahira-user.name}"
        }
        Action = [
          "s3:*"
        ]
        Resource = [
          "${aws_s3_bucket.mahira.arn}/*",
          "${aws_s3_bucket.mahira.arn}"
        ]
      }
    ]
  })
}
 
resource "aws_iam_user" "mahira-user" {
  name = var.user_name
}
 
resource "aws_iam_user_policy_attachment" "iam_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = aws_iam_user.mahira-user.name
}