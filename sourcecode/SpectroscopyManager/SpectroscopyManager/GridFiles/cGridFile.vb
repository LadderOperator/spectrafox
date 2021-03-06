﻿Imports System.ComponentModel
Imports MathNet.Numerics.LinearAlgebra.Double

''' <summary>
''' Class that represents a data grid file.
''' A grid file consists usually out of a bunch of SpectroscopyTables
''' and ScanImages that are stored together possessing the same properties.
''' </summary>
Public Class cGridFile

#Region "Properties"

    ''' <summary>
    ''' Variable that saves the FileObject-Reference from which the GridFile was created.
    ''' </summary>
    Public BaseFileObject As cFileObject

    <DescriptionAttribute("Shows the full path of the grid file."),
        CategoryAttribute("File Informations"),
        ReadOnlyAttribute(True)>
    Public Property FullFileName As String

    <DescriptionAttribute("Shows the extracted filename of the grid file file."),
        CategoryAttribute("File Informations"),
        ReadOnlyAttribute(True)>
    Public ReadOnly Property FileNameWithoutPath As String
        Get
            Return System.IO.Path.GetFileName(Me.FullFileName)
        End Get
    End Property

    ''' <summary>
    ''' Variable that stores a custom given name for that scan-image.
    ''' For normal images it is empty.
    ''' </summary>
    Protected _DisplayName As String = String.Empty

    ''' <summary>
    ''' Returns a name to show it in plots, etc.
    ''' Usually it returns the FileNameWithoutPath, but if
    ''' the <code>_DisplayName</code> is set, it will display this variable.
    ''' </summary>
    Public Property DisplayName As String
        Get
            If Me._DisplayName <> String.Empty Then
                Return Me._DisplayName
            Else
                Return Me.FileNameWithoutPath
            End If
        End Get
        Set(value As String)
            Me._DisplayName = value.Trim
        End Set
    End Property

    <DescriptionAttribute("Shows the date the grid file was started."),
       CategoryAttribute("General Image Properties"),
       ReadOnlyAttribute(True)>
    Public Property StartDate As Date

    <DescriptionAttribute("Shows the date the grid file ended."),
       CategoryAttribute("General Image Properties"),
       ReadOnlyAttribute(True)>
    Public Property EndDate As Date

    <DescriptionAttribute("Shows the delay in seconds before each spectrum is taken."),
       CategoryAttribute("General Image Properties"),
       ReadOnlyAttribute(True)>
    Public Property PreMeasurementDelay As Double

    <DescriptionAttribute("Shows the dimensions of the recorded grid."),
       CategoryAttribute("General Image Properties"),
       ReadOnlyAttribute(True)>
    Public Property GridDimensions As Size


    <DescriptionAttribute("Comment of the user."),
        CategoryAttribute("User Input"),
        ReadOnlyAttribute(True)>
    Public Property Comment As String

    <DescriptionAttribute("Center position of the grid."),
        CategoryAttribute("Location"),
        ReadOnlyAttribute(True)>
    Public Property GridCenterPosition As cNumericalMethods.Point2D

    <DescriptionAttribute("Dimensions of the grid."),
        CategoryAttribute("Location"),
        ReadOnlyAttribute(True)>
    Public Property GridDimensionsSI As cNumericalMethods.Point2D

    <DescriptionAttribute("Rotation angle of the grid."),
        CategoryAttribute("Location"),
        ReadOnlyAttribute(True)>
    Public Property GridAngle As Double

    <DescriptionAttribute("Signal column sweeped during the experiment."),
       CategoryAttribute("Experiment"),
       ReadOnlyAttribute(True)>
    Public Property SweepSignalColumn As String

    <DescriptionAttribute("Channels recorded in each point."),
    CategoryAttribute("Experiment"),
    ReadOnlyAttribute(True)>
    Public Property ChannelsRecorded As New List(Of String)

    <DescriptionAttribute("Parameters that stay fixed during the experiment."),
    CategoryAttribute("Experiment"),
    ReadOnlyAttribute(True)>
    Public Property ParametersForEachExperiment As New List(Of Dictionary(Of String, Double))

    ''' <summary>
    ''' Total number of parameters stored with each experiment
    ''' (= number of fixed parameters + number of experiment parameters).
    ''' Each parameter is stored as a single precision floating point number using 4 bytes (big-endian).
    ''' </summary>
    Public Property ParametersStoredWithExperiment As Integer

    <DescriptionAttribute("Number of points recorded during the experiment."),
        CategoryAttribute("Experiment"),
        ReadOnlyAttribute(True)>
    Public Property PointCount As Integer

    ''' <summary>
    ''' Storage for the individual experiments.
    ''' </summary>
    Public Property SpectroscopyTables As New List(Of cSpectroscopyTable)

    ''' <summary>
    ''' Spectroscopy table that is used to store all properties.
    ''' </summary>
    Protected Friend _TemplateSpectroscopyTable As New cSpectroscopyTable


#End Region

End Class
