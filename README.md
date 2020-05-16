# prion-bet-hedging-model
Modelling how a population of engineered prion bearing yeast cells behaves in fluctuating environments

The yeast cells are engineered to survive in two synthetic environments depending on their prion status. Population survival fractions and mutant ratios are experimentally determined. Prion state is experimentally measured using a reporter.
Each step is an environmental fluctuation from an environment (hygromycin) that is favorable to one of the prion states to one (canavanine) that is unfavorable to the original prion state, but favorable to the other prion state.
The model assumes the following:
- Survival fractions are unchanged with the number of environmental fluctuations
- Mutants survive both selections like the resistant prion type and they do not revert
- Fraction of mutants among reporter switched populations is the same on hygromycin and canavanine treatments
-If the reporter did not switch color, the cells are the original prion type
-Population composition is only altered during selection steps

Outcome:
mutants overtake the population due to their increased survival under both conditions

**Author:** Szilvia Kiriakov
