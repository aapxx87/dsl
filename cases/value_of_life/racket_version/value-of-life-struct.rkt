#lang racket

;; ---------------------
;; Структуры для описания ценности жизни
;; ---------------------

(struct mapping (name context lens-map perspective-sets) #:transparent)
(struct context (source key-themes reflections question) #:transparent)
(struct lens-entry (name perspectives) #:transparent)
(struct lens-map (entries) #:transparent)
(struct perspective-set (name description purpose dimensions dimension-details) #:transparent)


;; ---------------------
;; Пример данных
;; ---------------------

(define value-of-life
  (mapping
   'value-of-life
   (context
    "Фрагмент «Игры в бисер», беседа Иосифа Кнехта и отца Якова"
    '("Религиозные ценности vs светское воспитание"
      "Происхождение убеждения о ценности жизни"
      "Роль религии в формировании этических ориентиров")
    "Размышления о том, как личный опыт и культурный контекст влияют на восприятие ценности жизни."
    "Какие исторически наблюдаемые факторы коррелируют с изменением ценности человеческой жизни?")
   (lens-map
    (list
     (lens-entry 'historical-perspective
                 '("Исторические изменения в ценности жизни" "Влияние культурных факторов"))
     (lens-entry 'ethical-perspective
                 '("Этические дилеммы" "Религиозные и светские взгляды"))
     (lens-entry 'personal-perspective
                 '("Личный опыт" "Восприятие и рефлексия"))))
   (list
    (perspective-set
     'internal
     "Личностно-субъективная перспектива (эмоции, переживания, личная ценность)"
     "Разделение анализа на когнитивные, социокультурные, биологические и иные перспективы."
     '("cognitive" "evolutionary" "affective" "narrative_identity" "social_reflective" "ontological_security")
     (list
      (cons 'cognitive
            (hash
             'description "Когнитивные процессы и восприятие."
             'details '("внимание" "память" "мышление")
             'examples '("пример 1" "пример 2")))
      (cons 'evolutionary
            (hash
             'description "Эволюционные аспекты и инстинкты."
             'details '("выживание" "репродукция")
             'examples '("пример 3" "пример 4")))
      (cons 'affective
            (hash
             'description "Эмоции и чувства."
             'details '("радость" "страх" "грусть")
             'examples '("пример 5" "пример 6")))
      (cons 'narrative_identity
            (hash
             'description "Личностный нарратив и идентичность."
             'details '("жизненный путь" "самоидентификация")
             'examples '("пример 7" "пример 8")))
      (cons 'social_reflective
            (hash
             'description "Социальное отражение и взаимодействие."
             'details '("социальные нормы" "взаимоотношения")
             'examples '("пример 9" "пример 10")))
      (cons 'ontological_security
            (hash
             'description "Экзистенциальная безопасность и стабильность."
             'details '("чувство безопасности" "устойчивость")
             'examples '("пример 11" "пример 12"))))))))






(define (write-mapping-to-yaml m path)
  (define out (open-output-file path #:exists 'replace))
  (define ctx (mapping-context m))
  (fprintf out "mapping ~a: {\n" (symbol->string (mapping-name m)))
  (fprintf out "  context: {\n")
  (fprintf out "    source: \"~a\",\n" (context-source ctx))
  (fprintf out "    key-themes: [")
  (for ([t (in-list (context-key-themes ctx))])
    (fprintf out "\"~a\"" t)
    (unless (eq? t (last (context-key-themes ctx)))
      (fprintf out ", ")))
  (fprintf out "],\n")
  (fprintf out "    reflections: \"~a\",\n" (context-reflections ctx))
  (fprintf out "    question: \"~a\"\n" (context-question ctx))
  (fprintf out "  },\n")
  (fprintf out "\n")
  (fprintf out "  lens_map: {\n")
  (for ([entry (in-list (lens-map-entries (mapping-lens-map m)))])
    (fprintf out "    ~a: {\n" (symbol->string (lens-entry-name entry)))
    (fprintf out "      covers_perpectives: [")
    (for ([p (in-list (lens-entry-perspectives entry))])
      (fprintf out "\"~a\"" p)
      (unless (eq? p (last (lens-entry-perspectives entry)))
        (fprintf out ", ")))
    (fprintf out "]\n")
    (fprintf out "    }")
    (unless (eq? entry (last (lens-map-entries (mapping-lens-map m))))
      (fprintf out ",\n")))
  (fprintf out "\n  }\n")
  (fprintf out "\n")
  (fprintf out "  perspective_sets: {\n")
  (define (write-hash h indent)
    (for ([k (in-hash-keys h)])
      (define v (hash-ref h k))
      (fprintf out "~a~a: " indent (symbol->string k))
      (cond
        [(hash? v)
         (fprintf out "{\n")
         (write-hash v (string-append indent "  "))
         (fprintf out "~a}" indent)
         (unless (eq? k (last (hash-keys h)))
           (fprintf out ","))
         ]
        [(list? v)
         (fprintf out "[")
         (for ([item v])
           (fprintf out "\"~a\"" item)
           (unless (eq? item (last v))
             (fprintf out ", ")))
         (fprintf out "]")
         (unless (eq? k (last (hash-keys h)))
           (fprintf out ","))
         ]
        [else
         (fprintf out "\"~a\"" v)
         (unless (eq? k (last (hash-keys h)))
           (fprintf out ","))
         ])
      (fprintf out "\n")))
  (for ([ps (in-list (mapping-perspective-sets m))])
    (fprintf out "    ~a: {\n" (symbol->string (perspective-set-name ps)))
    (fprintf out "      description: \"~a\",\n" (perspective-set-description ps))
    (fprintf out "      purpose: \"~a\",\n" (perspective-set-purpose ps))
    (fprintf out "      available_dimensions: [")
    (for ([d (in-list (perspective-set-dimensions ps))])
      (fprintf out "\"~a\"" d)
      (unless (eq? d (last (perspective-set-dimensions ps)))
        (fprintf out ", ")))
    (fprintf out "],\n")
    (fprintf out "      dimension_details: {\n")
    (for ([dim-pair (in-list (perspective-set-dimension-details ps))])
      (define dim (cdr dim-pair))
      (fprintf out "        ~a: {\n" (symbol->string (car dim-pair)))
      (write-hash dim "          ")
      (fprintf out "        }")
      (unless (eq? dim-pair (last (perspective-set-dimension-details ps)))
        (fprintf out ",\n")))
    (fprintf out "\n      }\n")
    (fprintf out "    }")
    (unless (eq? ps (last (mapping-perspective-sets m)))
      (fprintf out ",\n")))
  (fprintf out "\n  }\n")
  (fprintf out "\n")
  (fprintf out "}\n")
  (close-output-port out))

(write-mapping-to-yaml value-of-life "value-of-life.yaml")


(define (write-semantic-map-to-yaml m path)
  (define out (open-output-file path #:exists 'replace))
  (define ctx (mapping-context m))
  ;; context: only source and key-themes
  (fprintf out "semantic_map:\n")
  (fprintf out "  context:\n")
  (fprintf out "    source: \"~a\"\n" (context-source ctx))
  (fprintf out "    key-themes:\n")
  (for ([t (in-list (context-key-themes ctx))])
    (fprintf out "      - \"~a\"\n" t))
  ;; lens_map: only names and links (no descriptions)
  (fprintf out "  lens_map:\n")
  (for ([entry (in-list (lens-map-entries (mapping-lens-map m)))])
    (fprintf out "    ~a:\n" (symbol->string (lens-entry-name entry)))
    (fprintf out "      links:\n")
    (for ([p (in-list (lens-entry-perspectives entry))])
      (fprintf out "        - \"~a\"\n" p)))
  ;; perspective_sets: names, dimensions, and perspectives (as links)
  (fprintf out "  perspective_sets:\n")
  (for ([ps (in-list (mapping-perspective-sets m))])
    (fprintf out "    ~a:\n" (symbol->string (perspective-set-name ps)))
    (fprintf out "      dimensions:\n")
    (for ([d (in-list (perspective-set-dimensions ps))])
      (fprintf out "        - \"~a\"\n" d)))
  (close-output-port out))

(write-semantic-map-to-yaml value-of-life "value-of-life-map.yaml")