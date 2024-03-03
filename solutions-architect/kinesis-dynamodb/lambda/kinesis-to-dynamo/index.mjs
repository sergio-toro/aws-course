import { DynamoDBClient, PutItemCommand } from '@aws-sdk/client-dynamodb';
import { marshall } from '@aws-sdk/util-dynamodb';

const dynamodb = new DynamoDBClient();

export const handler = async (event) => {
  try {
    console.log('Executing Kinesis to DynamoDB Lambda function', {
      dynamodbTable: process.env.DYNAMODB_TABLE,
      event: JSON.stringify(event, null, 2),
    });
    // Get the Kinesis event data
    const kinesisData = event.Records[0].kinesis.data;

    // Decode and parse the Kinesis data
    const decodedData = Buffer.from(kinesisData, 'base64').toString('utf8');
    const parsedData = JSON.parse(decodedData);

    // Transform the data as per your requirements
    const transformedData = transformData(parsedData);

    // Save the transformed data to DynamoDB
    const params = {
      TableName: process.env.DYNAMODB_TABLE,
      Item: marshall(transformedData),
    };

    console.log('Saving data to DynamoDB...', {
      params: JSON.stringify(params, null, 2),
    });

    const command = new PutItemCommand(params);
    await dynamodb.send(command);

    console.log('Data saved to DynamoDB successfully');
  } catch (error) {
    console.error('Error processing Kinesis event', error);
    throw error;
  }
};

function transformData(data) {
  // Implement your data transformation logic here
  // For now, we'll just return the data as is
  return data;
}
