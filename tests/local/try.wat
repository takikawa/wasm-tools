;; --enable-exceptions

(module $m
  (type (func))
  (event $exn (type 0))
  (func (try (do) (catch $exn drop)))
  (func (try (do) (catch $exn rethrow 0)))
  (func (try (do) (catch_all rethrow 0)))
  (func (try (do) (catch $exn) (catch_all rethrow 0)))
  (func (try (do) (unwind nop)))
  (func (try (do) (delegate 0)))
  (func (result i32)
    (try (result i32)
      (do (i32.const 42))
      (catch $exn drop (i32.const 42)))))
