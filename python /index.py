import json
import boto3

def lambda_handler(event, context):
    
    ses = boto3.client('ses')

    body = """
	    your state file was changed, you have to check it 
	
	    Regards,
	    Mostafa Ahmed Gomaa
    """

    ses.send_email(
	    Source = 'mostafa.97ahmed.ma@gmail.com',
	    Destination = {
		    'ToAddresses': [
			    'mostafa.97ahmed.ma@gmail.com'
		    ]
	    },
	    Message = {
		    'Subject': {
			    'Data': 'SES Demo',
			    'Charset': 'UTF-8'
		    },
		    'Body': {
			    'Text':{
				    'Data': body,
				    'Charset': 'UTF-8'
			    }
		    }
	    }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully sent email from Lambda using Amazon SES')
        }