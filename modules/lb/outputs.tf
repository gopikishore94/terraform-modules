output "tg_arn" {
    value = aws_alb_target_group.tg.arn
}
output "target_output_id" {
    value = aws_lb_target_group_attachment.my-alb-target-group-attachment1.*.id
}