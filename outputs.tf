output "id" {
  value = "${aws_subnet.default.id}"
}

output "cidr" {
  value = "${aws_subnet.default.cidr_block}"
}

output "arn" {
  value = "${aws_subnet.default.arn}"
}