output "tg_arn" {
    value = aws_alb_target_group.tg.arn
}
output "target_output_id" {
    value = aws_lb_target_group_attachment.my-alb-target-group-attachment1.*.id
}
output "load_balancer_arn" {
    value = aws_lb.test.arn
}
output "load_balancer_dns" {
    value = aws_lb.test.dns_name
}