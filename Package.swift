// swift-tools-version:5.10

import PackageDescription

let package = Package(
	name: "GCDWebServer",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
	],
	products: [
		.library(
			name: "GCDWebServer",
			targets: ["GCDWebServer", "GCDWebUploader"])
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "GCDWebServer",
			sources: ["Core", "Requests", "Responses", "Private"],
			publicHeadersPath: "Include"
		),
		.target(
			name: "GCDWebUploader",
			dependencies: ["GCDWebServer"],
			path: ".",
			exclude: ["README.md"],
			sources: ["Core"],
			resources: [.copy("./Bundle/GCDWebUploader.bundle"), .copy("PrivacyInfo.xcprivacy")],
			publicHeadersPath: "Include"
//			cxxSettings: [
//				.headerSearchPath("./private")
//			]
		)
	]
)
