import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T
import qs.Process

ColumnLayout {
	Layout.alignment: Qt.AlignHCenter
		RowLayout {
		Layout.alignment: Qt.AlignHCenter
		Text {
			text:	TimeProcess.h + "<b><font color='" + T.c.Text2 + "' >:</font></b>" + TimeProcess.m
			color: 	T.c.Text1
			font.family: "Terminess Nerd Font"
			font.pixelSize: 21
		}
	}
	Text {
		text:	TimeProcess.s
		color: 	T.c.Text1
		Layout.alignment: Qt.AlignHCenter
		font.family: "Terminess Nerd Font"
		font.pixelSize: 21
	}
}