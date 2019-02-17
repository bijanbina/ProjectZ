import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    spacing: 5 * scale_factor
    KeyCell
    {
        value: "Ctrl"
        label: "Ctrl"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        value: "Win"
        label: "\uf17a"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        value: "Alt"
        label: "Alt"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        value: "Space"
        label: ""
        theme_dark: darkEnbl
        width: 180 * scale_factor
    }
    KeyCell
    {
        value: "Ctrl"
        label: "Ctrl"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        value: "Menu"
        label: "\uf039"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        value: "Alt"
        label: "Alt"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "ArrowLeft"
        label: "\uf060"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "ArrowUp"
        label: "\uf063"
        theme_dark: darkEnbl
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "ArrowRight"
        label: "\uf061"
        theme_dark: darkEnbl
    }
}
