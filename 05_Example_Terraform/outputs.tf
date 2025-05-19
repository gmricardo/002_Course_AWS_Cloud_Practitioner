output "bucket_name" {
  value = aws_s3_bucket.create_bucket.id
}

output "instance_id" {
  value = aws_instance.create_instance_ec2.id
}
output "instance_public_ip" {
  value = aws_instance.create_instance_ec2.public_ip
}