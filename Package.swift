// swift-tools-version:5.4
import PackageDescription

let package = Package(
  name: "EasyBinding",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(
      name: "EasyBinding",
      targets: ["EasyBinding"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "EasyBinding",
      dependencies: [],
      path: "EasyBinding/Source"
    )
  ]
)
