import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";

import "../models/base.tsp";
import "../models/order.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

namespace CloudPayments;

@route("/orders")
@tag("Orders")
namespace Orders {
  /**
   * Создание счёта для отправки по почте
   *
   * Создаёт ссылку на оплату и при необходимости отправляет уведомление
   * плательщику по email, SMS или Viber.
   */
  @post
  @route("/create")
  @summary("Создание счёта для отправки по почте")
  op create(@body request: OrderCreateRequest): BaseResponse<OrderModel>;

  /**
   * Отмена созданного счёта
   *
   * Отменяет ранее созданный счёт. После отмены оплата по ссылке невозможна.
   */
  @post
  @route("/cancel")
  @summary("Отмена созданного счёта")
  op cancel(@body request: OrderCancelRequest): EmptyResponse;
}
