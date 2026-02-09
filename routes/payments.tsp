import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";

import "../models/base.tsp";
import "../models/transaction.tsp";
import "../models/threeds.tsp";
import "../models/requests.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

namespace CloudPayments;

/** Ответ на запрос оплаты - может быть успешной транзакцией, требованием 3DS или ошибкой */
alias PaymentResponse = BaseResponse<TransactionModel> | BaseResponse<ThreeDsRequiredModel>;

/** Ответ с моделью транзакции */
alias TransactionResponse = BaseResponse<TransactionModel>;

/** Ответ с моделью возврата */
alias RefundResponse = BaseResponse<RefundModel>;

@route("/payments")
@tag("Payments")
namespace Payments {
  @route("/cards")
  namespace Cards {
    /**
     * Одностадийная оплата по криптограмме
     *
     * Выполняет оплату в одну стадию - авторизация и списание происходят одновременно.
     * При необходимости 3-D Secure аутентификации возвращает данные для перенаправления на ACS.
     */
    @post
    @route("/charge")
    @summary("Одностадийная оплата по криптограмме")
    op charge(@body request: CryptogramPaymentRequest): PaymentResponse;

    /**
     * Двухстадийная оплата по криптограмме
     *
     * Выполняет только авторизацию (холдирование средств).
     * Для списания необходимо вызвать метод confirm.
     * При необходимости 3-D Secure аутентификации возвращает данные для перенаправления на ACS.
     */
    @post
    @route("/auth")
    @summary("Двухстадийная оплата по криптограмме")
    op auth(@body request: CryptogramPaymentRequest): PaymentResponse;

    /**
     * Завершение 3-D Secure аутентификации
     *
     * Вызывается после возврата плательщика с ACS.
     * Параметр TransactionId соответствует MD, PaRes получается от ACS.
     */
    @post
    @route("/post3ds")
    @summary("Завершение 3-D Secure аутентификации")
    op post3ds(@body request: Post3dsRequest): TransactionResponse;
  }

  /**
   * Подтверждение двухстадийного платежа
   *
   * Подтверждает ранее авторизованный платеж и инициирует списание средств.
   * Сумма подтверждения может быть меньше или равна сумме авторизации.
   */
  @post
  @route("/confirm")
  @summary("Подтверждение двухстадийного платежа")
  op confirm(@body request: ConfirmRequest): EmptyResponse;

  /**
   * Отмена платежа
   *
   * Отменяет авторизованный платеж до его подтверждения.
   * Применимо только для двухстадийных платежей.
   */
  @post
  @route("/void")
  @summary("Отмена платежа")
  op voidPayment(@body request: VoidRequest): EmptyResponse;

  /**
   * Возврат средств
   *
   * Возвращает средства по завершенному платежу.
   * Сумма возврата может быть меньше или равна сумме платежа.
   * Возможны частичные возвраты.
   */
  @post
  @route("/refund")
  @summary("Возврат средств")
  op refund(@body request: RefundRequest): RefundResponse;
}
