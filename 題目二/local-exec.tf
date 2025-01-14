resource "null_resource" "kubeconfig" {
  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    aws_iam_role.eks_service_role,
    aws_iam_role.eks_node_role
  ]
  
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${aws_eks_cluster.main.name}"
  }
}

resource "null_resource" "deploy" {
  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    aws_iam_role.eks_service_role,
    aws_iam_role.eks_node_role,
	null_resource.kubeconfig
  ]
  
  provisioner "local-exec" {
    command = "kubectl apply -f manifest"
  }
}