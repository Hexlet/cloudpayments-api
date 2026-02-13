import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";

import "../models/base.tsp";
import "../models/subscription.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

namespace CloudPayments;

@route("/subscriptions")
@tag("Subscriptions")
namespace Subscriptions {
  /**
   * Создание подписки на рекуррентные платежи
   *
   * Создаёт план подписки для автоматического списания средств
   * по указанному расписанию с использованием токена карты.
   */
  @post
  @route("/create")
  @summary("Создание подписки на рекуррентные платежи")
  op create(@body request: SubscriptionCreateRequest): BaseResponse<SubscriptionModel>;

  /**
   * Запрос информации о подписке
   *
   * Возвращает текущий статус и параметры подписки.
   */
  @post
  @route("/get")
  @summary("Запрос информации о подписке")
  op get(@body request: SubscriptionGetRequest): BaseResponse<SubscriptionModel>;

  /**
   * Поиск подписок
   *
   * Возвращает список подписок для указанного пользователя.
   */
  @post
  @route("/find")
  @summary("Поиск подписок")
  op find(@body request: SubscriptionFindRequest): BaseResponse<SubscriptionModel[]>;

  /**
   * Изменение подписки на рекуррентные платежи
   *
   * Изменяет параметры существующей подписки.
   * Если подписка была отменена или завершена, изменение любого атрибута
   * приведёт к её реактивации.
   */
  @post
  @route("/update")
  @summary("Изменение подписки на рекуррентные платежи")
  op update(@body request: SubscriptionUpdateRequest): BaseResponse<SubscriptionModel>;

  /**
   * Отмена подписки на рекуррентные платежи
   *
   * Отменяет активную подписку. Дальнейшие автоматические списания прекращаются.
   */
  @post
  @route("/cancel")
  @summary("Отмена подписки на рекуррентные платежи")
  op cancel(@body request: SubscriptionCancelRequest): EmptyResponse;
}
