<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>High Enrollment Courses</title>

                <style>
                    body {
                        margin: 0;
                        font-family: Arial, sans-serif;
                        background: #f4f7fb;
                        color: #1f2937;
                    }

                    .container {
                        width: 90%;
                        max-width: 1100px;
                        margin: 40px auto;
                        background: white;
                        padding: 30px;
                        border-radius: 18px;
                        box-shadow: 0 10px 30px rgba(0,0,0,0.12);
                    }

                    h1 {
                        text-align: center;
                        color: #4f46e5;
                        margin-bottom: 8px;
                    }

                    .subtitle {
                        text-align: center;
                        color: #64748b;
                        margin-bottom: 30px;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        overflow: hidden;
                        border-radius: 12px;
                    }

                    th {
                        background: #4f46e5;
                        color: white;
                        padding: 14px;
                        text-align: left;
                    }

                    td {
                        padding: 13px;
                        border-bottom: 1px solid #e5e7eb;
                    }

                    tr:hover {
                        background: #f1f5ff;
                    }

                    .badge {
                        padding: 5px 10px;
                        border-radius: 20px;
                        background: #e0e7ff;
                        color: #3730a3;
                        font-weight: bold;
                    }

                    .condition {
                        margin-top: 25px;
                        padding: 15px;
                        background: #eef2ff;
                        border-left: 5px solid #4f46e5;
                        border-radius: 8px;
                    }
                </style>
            </head>

            <body>

                <div class="container">

                    <h1>High Enrollment Courses</h1>

                    <div class="subtitle">
                        Courses having more than 40 students
                    </div>

                    <table>

                        <tr>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Faculty</th>
                            <th>Students</th>
                            <th>Credits</th>
                            <th>Type</th>
                        </tr>

                        <!-- XPath condition: students > 40 -->
                        <xsl:for-each select="courses/course[students &gt; 40]">

                            <!-- Descending enrollment -->
                            <xsl:sort select="students"
                                      data-type="number"
                                      order="descending"/>

                            <tr>

                                <td>
                                    <xsl:value-of select="code"/>
                                </td>

                                <td>
                                    <xsl:value-of select="name"/>
                                </td>

                                <td>
                                    <xsl:value-of select="faculty"/>
                                </td>

                                <td>
                                    <strong>
                                        <xsl:value-of select="students"/>
                                    </strong>
                                </td>

                                <td>
                                    <xsl:value-of select="credits"/>
                                </td>

                                <td>
                                    <span class="badge">
                                        <xsl:value-of select="type"/>
                                    </span>
                                </td>

                            </tr>

                        </xsl:for-each>

                    </table>

                    <div class="condition">
                        <strong>XPath Condition Used:</strong>
                        courses/course[students &gt; 40]
                    </div>

                </div>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>