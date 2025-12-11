(define-constant ERR-UNAUTHORIZED u100)

;; Fungible token definition for TFCOIN
(define-fungible-token tfcoin)

;; Mint new tokens. Only the contract owner may mint.
(define-public (mint (amount uint) (recipient principal))
  (begin
    (if (is-eq tx-sender (contract-owner))
        (ft-mint? tfcoin amount recipient)
        (err ERR-UNAUTHORIZED))))

;; Transfer tokens from the sender principal to a recipient.
;; The tx-sender must match the `sender` principal.
(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (if (is-eq tx-sender sender)
        (ft-transfer? tfcoin amount sender recipient)
        (err ERR-UNAUTHORIZED))))

;; Read-only helper to query balances.
(define-read-only (get-balance (owner principal))
  (ft-get-balance tfcoin owner))

;; Read-only helper to query total supply.
(define-read-only (get-total-supply)
  (ft-get-supply tfcoin))
