
output "bucket-name" {
  value = "${aws_s3_bucket.web_bucket.id}"
}