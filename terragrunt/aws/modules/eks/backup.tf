resource "aws_eks_cluster_backup" "eks_backup" {
  cluster_name        = module.eks.name
  backup_window_start = "00:00"
  backup_window_end   = "06:00"
  retention_period    = 7
  tags = {
    Name             = "EKS Backup"
    Backup_Retention = "7"

  }
}
