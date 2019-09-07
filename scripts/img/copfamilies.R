library(VineCopula)

ngrid <- 50L
cops <- list(
  Gauss = BiCop(1, 0.5),
  t = BiCop(2, 0.5, 3),
  Clayton = BiCop(3, 3),
  Gumbel = BiCop(4, 3),
  Frank = BiCop(5, 5),
  Joe = BiCop(6, 3)
)
descs <- list(
  expression(Gaussian~(alpha == 0.5)),
  expression(paste("Student's t (", alpha == 0.5, ", ", nu == 3, ")")),
  expression(Clayton~(alpha == 3)),
  expression(Gumbel~(alpha == 3)),
  expression(Frank~(alpha == 5)),
  expression(Joe~(alpha == 3))
)

pdf("img/gen/copfamilies.pdf", width = 7.2, height = 5.4)
par(mfrow = c(2, 3),
  omi = rep(0.1, 4),
  mai = rep(0.25, 4))
for (i in seq_along(cops))
  plot(cops[[i]],
    main = descs[[i]],
    type = "contour", size = ngrid)
dev.off()
