; inherits: (jsx)
(function_declaration
  body: (statement_block) @function.inner) @function.outer

(export_statement
  (function_declaration) @function.outer) @function.outer.start

(arrow_function
  body: (_) @function.inner) @function.outer

(method_definition
  body: (statement_block) @function.inner) @function.outer

(class_declaration
  body: (class_body) @class.inner) @class.outer

(export_statement
  (class_declaration) @class.outer) @class.outer.start

(for_in_statement
  body: (_)? @loop.inner) @loop.outer

(while_statement
  body: (_)? @loop.inner) @loop.outer

(do_statement
  body: (_)? @loop.inner) @loop.outer

(if_statement
  consequence: (_)? @conditional.inner
  alternative: (_)? @conditional.inner) @conditional.outer

(switch_statement
  body: (_)? @conditional.inner) @conditional.outer

(call_expression) @call.outer
(call_expression (arguments) @call.inner)

;; blocks
(_ (statement_block) @block.inner) @block.outer

;; parameters
(formal_parameters
  (identifier) @parameter.inner)

; function (v = default_value)
(formal_parameters
  (assignment_pattern) @parameter.inner)

; function ({ x }) ...
(formal_parameters
  (object_pattern) @paremeter.inner)

; function ([ x ]) ...
(formal_parameters
  (array_pattern) @paremeter.inner)

;; arguments
(arguments
  (_) @parameter.inner)
