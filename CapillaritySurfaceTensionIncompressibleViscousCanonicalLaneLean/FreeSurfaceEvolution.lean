import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure FreeSurfaceEvolutionPackage where
  interfacePosition : Type u
  initialInterface : Type v
  surfaceTension : ℝ
  gravity : ℝ
  kinematicBoundaryCondition : Prop
  dynamicBoundaryCondition : Prop
  wellPosedness : Prop

structure FreeSurfaceEvolutionEvidence (S : FreeSurfaceEvolutionPackage) where
  kinematicBoundaryConditionClosed : S.kinematicBoundaryCondition
  dynamicBoundaryConditionClosed : S.dynamicBoundaryCondition
  wellPosednessClosed : S.wellPosedness

def FreeSurfaceEvolutionClosed (S : FreeSurfaceEvolutionPackage) : Prop :=
  S.kinematicBoundaryCondition ∧ S.dynamicBoundaryCondition ∧ S.wellPosedness

theorem free_surface_evolution_closed_from_evidence (S : FreeSurfaceEvolutionPackage) (E : FreeSurfaceEvolutionEvidence S) :
    FreeSurfaceEvolutionClosed S := by
  exact And.intro E.kinematicBoundaryConditionClosed (And.intro E.dynamicBoundaryConditionClosed E.wellPosednessClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse