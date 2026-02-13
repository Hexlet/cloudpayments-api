import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/versioning";

import "./routes/payments.tsp";
import "./routes/subscriptions.tsp";
import "./routes/orders.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Versioning;

/**
 * API платежного шлюза CloudPayments для приема платежей по криптограмме
 */
@service(#{ title: "CloudPayments API" })
@versioned(Versions)
@server("https://api.cloudpayments.ru", "Production API")
namespace CloudPayments;

enum Versions {
  v1: "1.0.0",
}
