(in-package :sdl2-examples)

(require :sdl2)

(defun basic-test ()
  (sdl2:with-init (:video)
    (let* ((win (sdl2:create-window :flags '(:shown :opengl)))
           (gl-context (sdl2:gl-create-context win)))
      (sdl2:gl-make-current win gl-context)
      (sdl2:with-event-loop (:method :poll)
        (:keyup ()
                (sdl2:push-event :quit))
        (:mousemotion (:x x :y y :xrel xrel :yrel yrel :state state)
                      (print (format
                              nil
                              "Mouse motion abs(rel): ~a (~a), ~a (~a)~%Mouse state: ~a~%"
                              x xrel y yrel state)))
        (:idle ()
               (sdl2:gl-swap-window win))
        (:quit ()
               t))
      (sdl2:gl-delete-context gl-context)
      (sdl2:destroy-window win))))
