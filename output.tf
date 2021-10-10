output "vpc_id" {
  value = aws_vpc.vpc_dev.id
}

output "alb_dns" {
  value = aws_lb.alb01.dns_name
}
