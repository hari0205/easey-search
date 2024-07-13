import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class Request {
  @Field()
  query: string;
}
