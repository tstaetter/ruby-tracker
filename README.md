# RubyTracker
RubyTracker is a 

- completely unopinionated 
- ruby based 
- event sourced,
- API first

tracking solution including the ability to add custom
properties to users and resources for more in-depth analysis.

## Installation

1. Checkout the git repository [https://github.com/tstaetter/ruby-tracker](https://github.com/tstaetter/ruby-tracker)
2. If not present, generate the gRPC stubs:
    ```shell 
    grpc_tools_ruby_protoc --proto_path=proto --grpc_out=stubs --ruby_out=stubs proto/*
    ```
3. Adapt the configurations in `/config` to your needs

## Everything is an event

Each piece of information sent to this service is interpreted as an event. Events can be produced
by users, where a user can be a real, physical person using a browser, or some third party software, e.g.
your mobile app.

Either way, the user is producing events and sending them to this service.

### Events

An event, in the context of this service, is some kind of interaction with a resource.
Interactions may be (but are not limited to):
- Viewed
- Clicked
- Read
- TBC …

Resources on the other hand may be any kind of object available within the system to be
analysed. Is that system e.g. a website, resources may be (but are not limited to):
- Page
- Image
- Form
- TBC …

When a user sends an event, the canonical form is:

`(User) <interacts with> (Resource)`

If you are familiar with Graph databases you can see, that the relation
may be read in both directions, thus allowing not only getting all users who interacted
with a specific resources, but vice versa as well.

### Enrichments

Enrichments are the exception to the rule. They represent a special type of event, as they don't 
describe some kind of interaction, but are the way to add additional data to either a `User`, `Resource`
or `Assocation`.

Typical enrichments for users are:
- email address
- name
- gender
- postal address

Likewise, typical enrichments for resources would then be:
- file type
- file size
- arbitrary metadata

The same way users and resources can be enriched, interactions (associations) can be enriched as well. Imagine
a simple example:

`Return all male users, who have viewed my homepage yesterday`

Such a task would need the relation between all users and the resource `Homepage`, where the
relation is an interaction having the property e.g. `performed_at=<yesterday>`.
If you have sent corresponding events, such a query is pretty simple, but obviously, the opportunities
are countless.

### Interactions between resources

Lastly, one often neglected but very important aspect of any system subject to analysis is the interaction
between resources. In terms of a website, such interactions can be:

- Loaded
- References
- Links
- TBC …

Ruby Tracker aims to provide methodologies for tracking and analysing all of the above interactions, from
any point of view. That way, marketers as well as technicians should gain advantage of using RubyTracker. 