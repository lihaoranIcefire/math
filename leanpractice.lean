import data.real.basic

-- Lemma I created to help prove theorems

lemma x_le_max_x_y (x : ℝ) (y : ℝ) : x ≤ max x y :=
  by exact le_max_of_le_left (le_refl x)

lemma x_sub_y_eq_0_if_x_eq_y (x : ℝ) (y : ℝ) : (x=y) → (x-y=0) :=
begin
intros h₁,
rw h₁,
exact sub_self y,
end

lemma q_to_p_imply_notp_to_notq (p q : Prop) : (q → p) → (¬p → ¬q) :=
begin
intros hqp hnp h,
have hp : p, from hqp h,
exact hnp hp
end

lemma my (x : ℝ) (y : ℝ) : ¬(x-y=0) → ¬(x=y) :=
begin
exact q_to_p_imply_notp_to_notq (x-y=0) (x=y) (x_sub_y_eq_0_if_x_eq_y x y),
end

--------------------------------------------------------------------

def converges_to (s : ℕ → ℝ) (a : ℝ) :=
∀ ε > 0, ∃ N, ∀ n ≥ N, |s n - a| < ε

example : (λ x y : ℝ, (x + y)^2) = (λ x y : ℝ, x^2 + 2*x*y + y^2) :=
by { ext, ring }

example (a b : ℝ) : |a| = |a - b + b| :=
by  { congr, ring }

example {a : ℝ} (h : 1 < a) : a < a * a :=
begin
  convert (mul_lt_mul_right _).2 h,
  { rw one_mul },
  exact lt_trans zero_lt_one h
end

theorem converges_to_const (a : ℝ) : converges_to (λ x : ℕ, a) a :=
begin
  intros ε εpos,
  use 0,
  intros n nge, dsimp,
  rw [sub_self, abs_zero],
  apply εpos
end

theorem converges_to_add {s t : ℕ → ℝ} {a b : ℝ}
  (cs : converges_to s a) (ct : converges_to t b):
converges_to (λ n, s n + t n) (a + b) :=
begin
  intros ε εpos, dsimp,
  have ε2pos : 0 < ε / 2, { linarith },
  cases cs (ε / 2) ε2pos with Ns hs,
  cases ct (ε / 2) ε2pos with Nt ht,
  use max Ns Nt,
  intros n hn,
  have hNs : Ns ≤ n, { sorry },
  have hNt : Nt ≤ n, { sorry },
  have h1 : |s n - a| < ε/2, { sorry },
  have h2 : |t n - b| < ε/2, { sorry },
  have hε : (ε/2) + (ε/2) = ε, { sorry },
  have h12 : |s n - a| + |t n - b| < (ε/2) + (ε/2), { sorry },
  have hsum : |s n + t n - (a + b)| ≤ |s n - a| + |t n - b|, { sorry },
  have h3 : |s n + t n - (a + b)| < (ε/2) + (ε/2), { exact lt_of_le_of_lt hsum h12 },
  calc |s n + t n - (a + b)| < (ε/2) + (ε/2) : h3 ... = ε : hε
-- le_of_max_le_left 
end

#print lt_of_le_of_lt

theorem converges_to_mul_const {s : ℕ → ℝ} {a : ℝ}
    (c : ℝ) (cs : converges_to s a) :
  converges_to (λ n, c * s n) (c * a) :=
begin
  by_cases h : c = 0,
  { convert converges_to_const 0,
    { ext, rw [h, zero_mul] },
    rw [h, zero_mul] },
  have acpos : 0 < |c|,
    from abs_pos.mpr h,
  intros ε εpos,
  have hN : N ≤ n,
  sorry
end

theorem exists_abs_le_of_converges_to {s : ℕ → ℝ} {a : ℝ}
    (cs : converges_to s a) :
  ∃ N b, ∀ n, N ≤ n → |s n| < b :=
begin
  cases cs 1 zero_lt_one with N h,
  use [N, |a| + 1],
  intros n,
  --rw n ≥ N,
  sorry
end

lemma aux {s t : ℕ → ℝ} {a : ℝ}
    (cs : converges_to s a) (ct : converges_to t 0) :
  converges_to (λ n, s n * t n) 0 :=
begin
  intros ε εpos, dsimp,
  rcases exists_abs_le_of_converges_to cs with ⟨N₀, B, h₀⟩,
  have Bpos : 0 < B,
    from lt_of_le_of_lt (abs_nonneg _) (h₀ N₀ (le_refl _)),
  have pos₀ : ε / B > 0,
    from div_pos εpos Bpos,
  cases ct _ pos₀ with N₁ h₁,
  sorry
end

theorem converges_to_mul {s t : ℕ → ℝ} {a b : ℝ}
    (cs : converges_to s a) (ct : converges_to t b):
  converges_to (λ n, s n * t n) (a * b) :=
begin
  have h₁ : converges_to (λ n, s n * (t n - b)) 0,
  { apply aux cs,
    convert converges_to_add ct (converges_to_const (-b)),
    ring },
  convert (converges_to_add h₁ (converges_to_mul_const b cs)),
  { ext, ring },
  ring
end

theorem converges_to_unique {s : ℕ → ℝ} {a b : ℝ}
    (sa : converges_to s a) (sb : converges_to s b) :
  a = b :=
begin
  by_contradiction abne,
  have : |a - b| > 0,
  { sorry },
  let ε := |a - b| / 2,
  have εpos : ε > 0,
  { change |a - b| / 2 > 0, linarith },
  cases sa ε εpos with Na hNa,
  cases sb ε εpos with Nb hNb,
  let N := max Na Nb,
  have absa : |s N - a| < ε,
  { 
  have h₁ : N ≥ Na, { exact le_max_of_le_left (le_refl Na) },
  exact hNa N h₁
  },
  have absb : |s N - b| < ε,
  { 
  have h₂ : N ≥ Nb, { exact le_max_of_le_right (le_refl Nb) },
  exact hNb N h₂
  },
  have : |a - b| < |a - b|, { 

  sorry
  },
  exact lt_irrefl _ this
end

#print le_of_max_le_left

#print linear_order.max

variables {α : Type*} [linear_order α]

def converges_to' (s : α → ℝ) (a : ℝ) :=
∀ ε > 0, ∃ N, ∀ n ≥ N, |s n - a| < ε


