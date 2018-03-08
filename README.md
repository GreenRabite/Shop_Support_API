Shop​ ​Support​ ​API
High​ ​level
There are times when shops want to sell fonts that require a license key to use. One pain point that
exists: they have to manually message customers through Creative Market after every purchase to
provide when with a license key.
We want to empower shops to automatically send a license key to a customer without exposing
customer data (like an email) to the shop. We already send the shop a webhook for every sale that
includes some customer information and an order ID, so we'd like to introduce an API endpoint to
enable this new workflow feature!
Scope
Write a small API that:
1. Receives a request (e.g. POST /license-key)
{
userID: 123,
userID_customer: 456,
licenseKey: "SOME_STRING",
orderID: 123123
}
1. After validating the incoming request, we'll look up the customer's userID, ensure the orderID
exists between that customer and that shop, and then email them a license key.
2. For every successful API request, we'd like to store the license key that the shop sent along.
3. We'd also like to increment a count every time this is done (shown in the schema below).
Think of it like an aggregation column.
Data
Assume some prior knowledge on this project. Namely, there is a table with some users and a table
with order info. Feel free to seed in some dummy data. Schemas might look like:
USERS
userID (PK)
emailAddress
numLicenseKeysSent
LICENSE_KEYS
userID (customer)
licenseKey
ORDERS
orderID (PK)
userID_customer
userID_shop
Minimum​ ​Requirements
● Save things to a repo so we can review your work.
● Write in Ruby
● Libraries are welcome, but no frameworks. Sorry, Rails!
● Write your own queries. No ORMs, please.
● This is for our API, so tests are a requirement.
● Be thoughtful about validation and API responses.
