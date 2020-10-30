;; --enable-exceptions

(assert_malformed
  (module quote
    "(func (try (catch $exn)))"
  )
  "previous `try` had no `do`")

(assert_malformed
  (module quote
    "(func (try (unreachable) (catch $exn)))"
  )
  "previous `try` had no `do`")

(assert_malformed
  (module quote
    "(func (try (do)))"
  )
  "previous `try` had no `catch`")

(assert_malformed
  (module quote
    "(func (try (do) (unreachable)))"
  )
  "previous `try` had no `catch`")

(assert_malformed
  (module quote
    "(func (try (do) (catch $exn) drop))"
  )
  "expected `(`")

(assert_malformed
  (module quote
    "(func (try (do) (catch $exn) (drop)))"
  )
  "unexpected items after `catch`")

(assert_malformed
  (module quote
    "(func (try (do) (unwind) (drop)))"
  )
  "too many payloads inside of `(try)`")

(assert_malformed
  (module quote
    "(func (try (do) (delegate)))"
  )
  "expected an identifier or u32")

(assert_malformed
  (module quote
    "(func (try (do) (delegate 0 11"
  )
  "expected an instruction")

(assert_malformed
  (module quote
    "(func (try (do) (delegate 0) (drop)))"
  )
  "too many payloads inside of `(try)`")
