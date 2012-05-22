<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Upload Demo</title>
<script src="template/js/jquery.js" type="text/javascript"></script>
<script src="template/js/jquery.uploadify.v2.1.4.min.js" type="text/javascript"></script>
<script src="template/js/swfobject.js" type="text/javascript"></script>
<link href="template/css/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    var uploadnet = {
        common: {
            initialized: false,

            config: {
                id: '#<%=FileUpload.ClientID%>'
            },
            
            init : function() {
                this.initialized = true;
                this.doLoad();
            },

            doLoad : function(counter) {
                $(uploadnet.common.config.id).uploadify({
                        'uploader': 'template/js/uploadify.swf',
                        'cancelImg': 'template/images/cancel.png',
                        'buttonText': 'Get Files',
                        'script': 'uploadify.ashx',
                        'multi': true
                });
            },

            doUpload : function(counter) {
                $(uploadnet.common.config.id).uploadifyUpload()
            },

            doClear : function() {
                $(uploadnet.common.config.id).uploadifyClearQueue()
            }
        }     
    };

    var readyFn = function() {
        if (!uploadnet.common.initialized) {
            uploadnet.common.init();
        }
    };

    $(document).ready(readyFn);
</script>

</head>
<body>
    <h1>Upload Demo</h1>
    <br />
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <input type="button" value="Upload" onclick="return uploadnet.common.doUpload()" />
            </td>
            <td>
                <input type="button" value="Clear" onclick="return uploadnet.common.doClear()" />
            </td>
        </tr>
    </table>
    <asp:FileUpload id="FileUpload" runat="server" />
    </form>
</body>
</html>
