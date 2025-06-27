resource "aws_s3_bucket" "my-tf-test-bucket12457881" {
  bucket = "my-tf-test-bucket12457881"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [aws_route_table_association.public]
}

resource "aws_s3_bucket" "my-tf-test-bucket12457882" {
  bucket = "my-tf-test-bucket12457882"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.my-tf-test-bucket12457881]
}

resource "aws_s3_bucket" "my-tf-test-bucket12457883" {
  bucket = "my-tf-test-bucket12457883"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.my-tf-test-bucket12457882]
}

