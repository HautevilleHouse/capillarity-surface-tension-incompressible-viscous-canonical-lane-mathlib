import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.InterfaceCurvature

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure FreeBoundaryEvolutionPackage where
  initialInterface : Type u
  velocityAtInterface : ℝ³ → ℝ³
  normalVector : ℝ³ → ℝ³
  advectionEquation : Prop
  curvatureDrivenMotion : Prop
  tangentialComponent : Prop

structure FreeBoundaryEvolutionEvidence (F : FreeBoundaryEvolutionPackage) where
  advectionEquationClosed : F.advectionEquation
  curvatureDrivenMotionClosed : F.curvatureDrivenMotion
  tangentialComponentClosed : F.tangentialComponent

def FreeBoundaryEvolutionClosed (F : FreeBoundaryEvolutionPackage) : Prop :=
  F.advectionEquation ∧ F.curvatureDrivenMotion ∧ F.tangentialComponent

theorem free_boundary_evolution_closed_from_evidence (F : FreeBoundaryEvolutionPackage)
    (E : FreeBoundaryEvolutionEvidence F) : FreeBoundaryEvolutionClosed F := by
  exact And.intro E.advectionEquationClosed
    (And.intro E.curvatureDrivenMotionClosed E.tangentialComponentClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse