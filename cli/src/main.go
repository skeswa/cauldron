package main

import (
	"os"

	"github.com/codegangsta/cli"
)

const (
	appName        = "cauldron"
	appDescription = "Collaborative coding, made magical."
)

func main() {
	app := cli.NewApp()
	app.Name = appName
	app.Usage = appDescription
	app.Action = func(c *cli.Context) {
		println("boom! I say!")
	}

	app.Run(os.Args)
}
