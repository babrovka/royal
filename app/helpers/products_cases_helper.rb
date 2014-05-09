module ProductsCasesHelper

  # рендерим «совет по продукции»
  # данный алгоритм рендерит все советы в случайном порядке
  # можно задать, как часто рендерить такой блок
  def render_products_case(i)
    repeat_each = 2
    mod = (i+1)%repeat_each
    if mod==0
      num = rand(0..products_cases.count-1)
      render 'cases/case_banner', products_case: products_cases[num]
    end
  end
end